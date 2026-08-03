# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '3.5.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/3.5.0/asc_3.5.0_macOS_arm64'
      sha256 '6a1f695e6c0d2d97d4ab23c7fdfb0c7fa5d49d67a5e9b497fce5615bab751b6f'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/3.5.0/asc_3.5.0_macOS_amd64'
      sha256 'f4692760e8ec1a8c188b7ca78a549957f271f1802e0c56e22d7d9e3677c00dfc'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_3.5.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_3.5.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
