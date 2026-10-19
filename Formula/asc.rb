# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.16.0'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.16.0/asc_5.16.0_macOS_arm64'
      sha256 '99bcbf5a7bba3aac59e8d9e36a06bcb8dc15cd7a92db8ecacb42da464dce44c3'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.16.0/asc_5.16.0_macOS_amd64'
      sha256 'e6c7ff486fff6e52bede69d6a197221c8b765d03c070775d2ae1c38a9a7924f8'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.16.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.16.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
