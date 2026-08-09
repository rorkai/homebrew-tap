# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '3.7.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/3.7.0/asc_3.7.0_macOS_arm64'
      sha256 '610be35610237ba118822004ed69ed776244bd265442df00870102a1bce4803d'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/3.7.0/asc_3.7.0_macOS_amd64'
      sha256 '9bc2f272a5a3b8288ca27bb17cd30180a83a6b06c0f44d33429a73a79e7bfef5'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_3.7.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_3.7.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
